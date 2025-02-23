fluidPage(
  fluidRow(
    column(width = 6, style='padding:0px;',
           widgetUserBox(
             title = i18n$t("青森県"),
             subtitle = i18n$t('東北地方'), 
             width = 12,
             # src = 'Pref/aomori.png', 
             type = 2, 
             color = 'aqua-active',
             collapsible = F,
             sprintf(
                i18n$t("こちらは%sの発生状況をまとめたページです。厚労省のまとめより早く状況を把握できますが、県の集計時間は厚労省の発表時間と完全に一致していないため、タイムラグによる数値の違いが生じる可能性もありますので、予めご注意ください。また、速報では陰性から再び陽性になった人は再計算に含めていないため、自治体発表の陽性者数と数値が異なる場合があります。"),
                i18n$t("青森県")
             ),
             footer = tagList(
               tags$small(icon('database'),
                          tags$a(href = 'https://opendata.pref.aomori.lg.jp/dataset/1531.html',
                                 i18n$t('青森県内における新型コロナウイルス感染症の感染動向データ')),
                          icon('database'),
                          tags$a(href = 'https://signate.jp/competitions/260/discussions', 
                                 'SIGNATE - COVID-19 Chanllenge')
               )
             )
           )
    ),
    column(width = 6,
           uiOutput('AomoriValueBoxes') %>% withSpinner(proxy.height = '200px')
    )
  ),
  fluidRow(
    boxPlus(
      width = 12,
      closable = F,
      title = tagList(icon('chart-line'), sprintf(i18n$t("%sの発生状況"), i18n$t("青森県"))),
      fluidRow(
        column(
          width = 6, 
          echarts4rOutput('AomoriContact') %>% withSpinner()
        ),
        column(
          width = 6,
          echarts4rOutput('AomoriSummary') %>% withSpinner()
        )
      ),
      footer = tags$small(icon('lightbulb'), i18n$t("凡例クリックすると表示・非表示の切替ができます。"))
    )
  ), 
  fluidRow(
    boxPlus(
      width = 12,
      closable = F, 
      collapsed = T, 
      collapsible = T,
      enable_label = T, 
      label_text = tagList(i18n$t("もっと見る"), icon('hand-point-right')), 
      label_status = 'warning',
      # title = tagList(icon('map-marked-alt'), '道内の感染者'),
      fluidRow(
        column(
          width = 8,
          # leafletOutput('hokkaidoConfirmedMap', height = '500px') %>% withSpinner(),
          # dataTableOutput('hokkaidoPatientTable') %>% withSpinner(),
        ),
        column(
          width = 4,
          # uiOutput('hokkaidoProfile') %>% withSpinner()
        )
      )# ,
      # fluidRow(
      #   column(
      #     width = 8,
      #     dataTableOutput('hokkaidoPatientTable') %>% withSpinner(),
      #   )
      # )
    )
  )
)