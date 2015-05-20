((template) =>

    instance = null

    Helpers.Client.Application.addCallbacksToTemplate template.viewName, [
        'adaptive-label'
    ]

    isJobSelected = (job) ->
        return getSelectedJobs().any((availableJob) => availableJob.id is job.id)

    getSelectedJobs = ->
        instance.data.selectedJobs.get()

    setSelectedJobs = (selectedJobs) ->
        instance.data.selectedJobs.set selectedJobs

    template.created = ->
        instance = Template.instance()

        @data.availableJobsMatrix = @data.AvailableJob.find().fetch().toMatrix 4;

        @data.selectedJobs = new ReactiveVar()
        setSelectedJobs []

    template.helpers {
        isSelected: ->
            isJobSelected @
    }

    template.events {
        'click .job': (source, templateInstance) ->
            clickedJob = @

            alreadySelected = isJobSelected clickedJob

            selectedJobs = getSelectedJobs()

            if alreadySelected
                selectedJobs = selectedJobs.remove((x) => x.id is clickedJob.id)
            else
                selectedJobs.push clickedJob

            setSelectedJobs selectedJobs
    }

    @AutoForm.hooks {
        insertCandidateForm:
            onSuccess: (formType, result) ->

                form = $ @event.target

                candidate = Candidate.first result
                if candidate
                    candidate.push {
                        jobs: getSelectedJobs()
                    }
                    candidate = Candidate.first result
                    Helpers.Client.Meteor.CallMethod 'notifyOnCandidate', candidate, getSelectedJobs(), (errors, result) ->
                        if not errors
                            setSelectedJobs []
                            Helpers.Client.Form.ClearInputs form
                            sweetAlert("Great job!", "We'll be in touch soon", "success")

    }

)(Template['core.index'])