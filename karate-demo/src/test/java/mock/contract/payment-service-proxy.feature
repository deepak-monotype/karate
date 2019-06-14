Feature: payment service proxy (or api-gateway !)

Background:
* eval if (paymentServiceUrl && paymentServiceUrl.startsWith('https')) karate.configure('ssl', true)

Scenario: pathMatches('/payments') && methodIs('post')
    * karate.proceed(paymentServiceUrl)
    # example of adding delay via a post-processing hook
    # * def afterScenario = function(){ karate.log('sleeping ..'); java.lang.Thread.sleep(3000); }

Scenario: pathMatches('/payments')
    * karate.proceed(paymentServiceUrl)

Scenario: pathMatches('/payments/{id}') && methodIs('delete')
    * karate.proceed(paymentServiceUrl)

Scenario: pathMatches('/payments/{id}')    
    * karate.proceed(paymentServiceUrl)

# 'catch-all' rule
Scenario:  
    # if arg to karate.proceed() is null, incoming url will be used as-is (http proxy)
    * karate.proceed(paymentServiceUrl)
