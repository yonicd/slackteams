# User list loads

    Code
      with_mock_api({
        get_users_list()
      })
    Output
      # A tibble: 3 x 20
        id          team_id  name  deleted color real_~1 tz    tz_la~2 tz_of~3 is_ad~4
        <chr>       <chr>    <chr> <lgl>   <chr> <chr>   <chr> <chr>     <int> <lgl>  
      1 USLACKBOT   TNE5M7U~ slac~ FALSE   7575~ Slackb~ Amer~ Pacifi~  -28800 FALSE  
      2 UNTFB8LTH   TNE5M7U~ yoni~ FALSE   9f69~ yoni    Amer~ Easter~  -18000 TRUE   
      3 U0111B8S0LX TNE5M7U~ jont~ FALSE   4bbe~ Jon Ha~ Amer~ Centra~  -21600 FALSE  
      # ... with 10 more variables: is_owner <lgl>, is_primary_owner <lgl>,
      #   is_restricted <lgl>, is_ultra_restricted <lgl>, is_bot <lgl>,
      #   is_app_user <lgl>, updated <int>, is_email_confirmed <lgl>,
      #   who_can_share_contact_card <chr>, has_2fa <lgl>, and abbreviated variable
      #   names 1: real_name, 2: tz_label, 3: tz_offset, 4: is_admin

# Channel info loads

    Code
      res_convo_list
    Output
      # A tibble: 3 x 23
        id        name   is_ch~1 is_gr~2 is_im is_mpim is_pr~3 created is_ar~4 is_ge~5
        <chr>     <chr>  <lgl>   <lgl>   <lgl> <lgl>   <lgl>     <int> <lgl>   <lgl>  
      1 CNRKL1H6C gener~ TRUE    FALSE   FALSE FALSE   FALSE    1.57e9 FALSE   TRUE   
      2 CNRKL1JLQ random TRUE    FALSE   FALSE FALSE   FALSE    1.57e9 FALSE   FALSE  
      3 CNTFB9215 slack~ TRUE    FALSE   FALSE FALSE   FALSE    1.57e9 FALSE   FALSE  
      # ... with 13 more variables: unlinked <int>, name_normalized <chr>,
      #   is_shared <lgl>, is_org_shared <lgl>, is_pending_ext_shared <lgl>,
      #   context_team_id <chr>, creator <chr>, is_ext_shared <lgl>, is_member <lgl>,
      #   num_members <int>, user <chr>, is_user_deleted <lgl>, priority <int>, and
      #   abbreviated variable names 1: is_channel, 2: is_group, 3: is_private,
      #   4: is_archived, 5: is_general

---

    Code
      convo_info
    Output
      $ok
      [1] TRUE
      
      $channel
      $channel$id
      [1] "CNTFB9215"
      
      $channel$name
      [1] "slack-r"
      
      $channel$is_channel
      [1] TRUE
      
      $channel$is_group
      [1] FALSE
      
      $channel$is_im
      [1] FALSE
      
      $channel$is_mpim
      [1] FALSE
      
      $channel$is_private
      [1] FALSE
      
      $channel$created
      [1] 1569457813
      
      $channel$is_archived
      [1] FALSE
      
      $channel$is_general
      [1] FALSE
      
      $channel$unlinked
      [1] 0
      
      $channel$name_normalized
      [1] "slack-r"
      
      $channel$is_shared
      [1] FALSE
      
      $channel$is_org_shared
      [1] FALSE
      
      $channel$is_pending_ext_shared
      [1] FALSE
      
      $channel$pending_shared
      list()
      
      $channel$context_team_id
      [1] "TNE5M7UGK"
      
      $channel$parent_conversation
      NULL
      
      $channel$creator
      [1] "UNTFB8LTH"
      
      $channel$is_ext_shared
      [1] FALSE
      
      $channel$shared_team_ids
      $channel$shared_team_ids[[1]]
      [1] "TNE5M7UGK"
      
      
      $channel$pending_connected_team_ids
      list()
      
      $channel$is_member
      [1] TRUE
      
      $channel$topic
      $channel$topic$value
      [1] ""
      
      $channel$topic$creator
      [1] ""
      
      $channel$topic$last_set
      [1] 0
      
      
      $channel$purpose
      $channel$purpose$value
      [1] ""
      
      $channel$purpose$creator
      [1] ""
      
      $channel$purpose$last_set
      [1] 0
      
      
      $channel$previous_names
      list()
      
      
      attr(,"class")
      [1] "conversations.info" "list"              
      attr(,"slack_method")
      [1] "conversations.info"
      attr(,"body")
      attr(,"body")$channel
      [1] "CNTFB9215"
      
      attr(,"body")$limit
      [1] 1000
      

---

    Code
      with_mock_api({
        get_conversations_members(slack_test_channel)
      })
    Output
      # A tibble: 2 x 1
        value      
        <chr>      
      1 UNTFB8LTH  
      2 U0111B8S0LX

