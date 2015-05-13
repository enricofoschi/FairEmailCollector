((template) ->
    Helpers.Client.Application.addCallbacksToTemplate template.viewName, [
        'adaptive-label'
    ]

    isJobSelected = (job) ->
        return getSelectedJobs().any((availableJob) => availableJob.id is job.id)

    getSelectedJobs = ->
        Template.instance().data.selectedJobs.get()

    setSelectedJobs = (selectedJobs) ->
        Template.instance().data.selectedJobs.set selectedJobs

    template.created = ->
        @data.availableJobsMatrix = @data.AvailableJob.find().fetch().toMatrix 3;

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
    })(Template['core.index'])