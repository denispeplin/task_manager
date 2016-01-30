module TasksHelper
  def links_to_files(task)
    task.task_files.map do |task_file|
      [
        link_to(task_file.attachment_file_name, task_file.attachment.url),
        link_to(
          icon('remove'),
          task_file_path(task_file),
          method: :delete, remote: true, data: { confirm: 'Are you sure?' },
          class: 'destroy-task-file'
        )
      ].join('&nbsp;')
    end.join("<br>\n").html_safe
  end
end
