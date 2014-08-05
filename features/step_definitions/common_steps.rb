Given(/^the anonymous library screen is displayed$/) do
  enter_app_as_anonymous_user()
  expect_page(anonymous_library_page)
end

Then(/^the ([A-Za-z\-\s]*) should be displayed$/) do |page_name|
  page = page_model_instance(page_name)
  expect_page(page)
end