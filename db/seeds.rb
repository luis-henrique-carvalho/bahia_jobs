# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
[
  'Rails', 'Ruby', 'React', 'Angular', 'Vue', 'Ember', 'Node.js', 'PostgreSQL', 'MongoDB', 'Redis', 'GraphQL',
  'RESTful API', 'Docker', 'Kubernetes', 'AWS', 'GCP', 'Azure', 'CI/CD', 'TDD', 'BDD', 'DDD', 'SOLID', 'OOP', 'FP',
  'DDD', 'Microservices', 'Agile', 'Scrum', 'Kanban', 'Lean', 'XP', 'Waterfall', 'RUP', 'RAD', 'DevOps', 'Git', 'SVN',
  'Mercurial', 'Bitbucket', 'GitHub', 'GitLab'
].each do |tag|
  Tag.find_or_create_by(name: tag)
end

user = User.find_or_create_by(email: 'admin@admin') do |u|
  u.password = '123123'
end

company = FactoryBot.create(:company, user:)

500.times do
  position = FactoryBot.create(:position, company:)
  position.tags << Tag.all.sample(3)
end
