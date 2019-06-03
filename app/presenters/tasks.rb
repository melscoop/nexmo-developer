class Tasks
  # What tasks do we have available?
  TASKS = {} # rubocop:disable Style/MutableConstant
  TASK_TITLES = {} # rubocop:disable Style/MutableConstant
  Dir.glob("#{Rails.root}/config/tasks/*.yml") do |filename|
    t = YAML.load_file(filename)
    TASKS[t['product']] = [] unless TASKS[t['product']]
    p = filename.gsub('.yml', '').gsub("#{Rails.root}/config/tasks/", "/#{t['product']}/task/")
    TASKS[t['product']].push({
      path: p,
      title: t['title'],
      is_file?: true,
      is_task?: true,
    })

    TASK_TITLES[p] = t['title']
  end

  def self.document_meta(path)
    if path.include? '/task/'
      return { 'title' => TASK_TITLES[path.gsub('/task/', '')] }
    end
    YAML.load_file(path)
  end
end
