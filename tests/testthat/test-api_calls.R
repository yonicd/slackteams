testthat::context('API calls')

res <- get_users_list()

testthat::describe('team info',{

  it('class',{
    testthat::expect_s3_class(res,'data.frame')
  })

  it('user names',{
    testthat::expect_equal(res$name,c('slackbot','yonicd','jonthegeek'))
  })

})

