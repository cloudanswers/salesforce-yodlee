
# Yodlee API wrapper for Salesforce.com's Apex Language


## Metadata API Installation

```sh
$ git clone git@github.com:cloudanswers/salesforce-yodlee.git
$ cd salesforce-yodlee
$ SALESFORCE_USERNAME=xxx SALESFORCE_PASSWORD=YYY SALESFORCE_URL=https://login.salesforce.com ant deploy
```

## Unmanaged Package Install

TODO link here

## Usage

The Yodlee class is a global class which allows you to use it in any apex code.


### Authentication using Cobrand Credentials
Yodlee requires a cobSessionToken before we can access the API.
Get your credentials at [developer.yodlee.com](https://developer.yodlee.com).

```js
String username = 'xxx';
String password = 'yyy';
Yodlee.use(username, password);

```

### OAuth Requests
Yodlee uses the standard oauth authentication flow in order to allow apps to act on a user's behalf.
The API provides a convenience method to help you authenticate your users.

```js
Yodlee.User yodleeUser = Yodlee.userLogin(sbMemsomeuser, sbMemsomeuser);
```

### Using the API, GET User Accounts

Returns the information related to the specified accounts aggregated by the User:
[Yodlee Docs](https://developer.yodlee.com/Aggregation_API/Aggregation_Services_Guide/Aggregation_REST_API_Reference/getSiteAccounts)

```js
Yodlee.Account[] yAccounts = yodleeUser.getAccounts();
```

### GET User Transactions
Executes a transaction search and returns the first page result:
[Yodlee Docs](https://developer.yodlee.com/Aggregation_API/Aggregation_Services_Guide/Aggregation_REST_API_Reference/executeUserSearchRequest)

```js
yodlee.getTransactions(accessToken, {
  containerType: 'All',
  higherFetchLimit: 500,
  lowerFetchLimit: 1,
  resultRangeEndNumber: 60,
  resultRangeStartNumber: 1,
  searchFilterCurrencyCode: 'GBP',
  ignoreUserInput: true
})
  .then(function(response) {})
  .catch(function(error) {});

```

## Contributing

### Unit tests

Common sense github; fork and pull to master branch.

## License
MIT © [James Sullivan, CloudAnswers](https://www.linkedin.com/in/jamesrsullivan)
