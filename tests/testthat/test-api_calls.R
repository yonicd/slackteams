testthat::context('API calls')

res_users_list <- slackteams:::get_users_list()
res_groups_list <- slackteams:::get_groups_list()
res_channels_list <- slackteams:::get_channels_list()
res_convo_list <- slackteams:::get_conversations_list()

test_chnl         <- res_channels_list$id[res_channels_list$name=='slack-r']
res_channels_info <- slackteams:::get_channels_info(channel = test_chnl)
convo_info <- slackteams:::get_conversations_info(test_chnl)

group_info <- slackteams:::get_groups_info(test_chnl)

convo_members <- slackteams:::get_conversations_members(test_chnl)

testthat::describe('team info',{

  it('class',{
    testthat::expect_s3_class(res_users_list,'data.frame')
  })

  it('user names',{
    testthat::expect_equal(res_users_list$name,c('slackbot','yonicd','jonthegeek'))
  })

})

testthat::describe('group info',{

  it('group list',{
    testthat::expect_equal(nrow(res_groups_list),0L)
  })

  it('class',{
    testthat::expect_s3_class(group_info,'groups.info')
  })

  it('no groups',{
    testthat::expect_equal(group_info[[1]],'channel_not_found')
  })
})

testthat::describe('channel info',{

  it('class',{
    testthat::expect_s3_class(res_channels_list,'data.frame')
  })

  it('channel names',{
    testthat::expect_equal(res_channels_list$name,c('general','random','slack-r'))
  })

  it('channel info class',{
    testthat::expect_s3_class(res_channels_info,'channels.info')
  })

  it('channel info id',{
    testthat::expect_equal(res_channels_info$channel$id,'CNTFB9215')
  })
})

testthat::describe('converstion info',{

  it('class',{
    testthat::expect_s3_class(res_convo_list,'data.frame')
  })

  it('convo id',{
    testthat::expect_equal(res_convo_list$id,c("CNRKL1H6C",  "CNRKL1JLQ","CNTFB9215","D010LH9S7H8","DNRKMTFGD","DNCS5PB7U"  ))
  })

  it('convo channel count',{
    testthat::expect_equal(sum(res_convo_list$is_channel,na.rm = TRUE),3)
  })

  it('convo im count',{
    testthat::expect_equal(sum(res_convo_list$is_im,na.rm = TRUE),3)
  })

  it('convo members',{
    testthat::expect_equal(convo_members$value,c('UNTFB8LTH','U0111B8S0LX'))
  })

  it('convo info class',{
    testthat::expect_s3_class(convo_info,'conversations.info')
  })

  it('convo info id',{
    testthat::expect_equal(convo_info$channel$id,'CNTFB9215')
  })

})

