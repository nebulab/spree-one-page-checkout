## HOW TO TEST

Just run the following commands:

```bash
git clone git@github.com:nebulab/spree-one-page-checkout.git
cd spree-one-page-checkout

bundle

rake db:create
rake db:migrate
rake db:seed
rake spree_sample:load

rails s
```

And visit: `localhost:3000/`.

