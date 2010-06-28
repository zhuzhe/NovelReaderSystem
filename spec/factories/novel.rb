Factory.define :novel do |novel|
    novel.name  "black and white"
    novel.writer "Belen"
    novel.url "path to this novel"
    novel.association :category
end