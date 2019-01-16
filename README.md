# Take home pizza ordering website inspired by Papa Murphy's user unfriendly website
- Visit the site here! Deployed using AWS [Check me out!](http://3.17.56.100/)

## Features
- User friendly
- Not confusing
- Straight forward user flow through site, no confusing routes or extra pages
- User authentication 
- Administrative features to perform CRUD operations to the database
- Stripe API integration

### Here's a simple overview of what a user could do

1. User will hit the landing page
![Landing page](./app/assets/images/pizzaLanding.png)
2. User will log in
![Login page](./app/assets/images/pizzaLogin.png)
3. User can create an order (if not authenticated user will be rerouted to login)
![menu and order screen](./app/assets/images/menuOrder.png)
4. User checks out order and pays via Stripe API
![Stripe modal](./app/assets/images/stripePayment.png)
5. If payment processes they are rerouted to a thank you page
![thanks page](./app/assets/images/thankYou.png)

#### Admin features
1. User can log in with either the regular login above or this admin page
![Admin order page](./app/assets/images/adminOrders.png)
2. There are also forms to create, update, or delete items while logged in as an admin (Non admin users are rerouted to the home page)


