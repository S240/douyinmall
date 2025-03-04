# .PHONY:	gen-frontend
# gen-frontend:
# 	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/home.proto  --service frontend -module ${ROOT_MOD}/app/frontend -I ../../idl

# .PHONY:	gen-auth-page
# gen-auth-page:
# 	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/auth_page.proto  --service frontend -module ${ROOT_MOD}/app/frontend -I ../../idl

# .PHONY:	gen-rpc-client
# gen-rpc-client:
# 	@cd rpc_gen && cwgo client --type RPC --idl ../idl/user.proto --service user -module ${ROOT_MOD}/rpc_gen -I ../idl 

# .PHONY:	gen-rpc-server
# gen-rpc-server:
# 	@cd app/user && cwgo server --type RPC --idl ../../idl/user.proto --service user -module ${ROOT_MOD}/app/user -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"
export ROOT_MOD=github.com/wuyuesong/douyinmall


.PHONY:	all
all: gen-frontend gen-rpc

.PHONY: gen-frontend
gen-frontend: gen-frontend-home gen-product-page gen-category-page gen-auth-page gen-cart-page gen-checkout-page gen-order-page

.PHONY:	gen-frontend-home
gen-frontend-home:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/home.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-auth-page
gen-auth-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/auth_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-product-page
gen-product-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/product_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-category-page
gen-category-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/category_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-cart-page
gen-cart-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/cart_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-checkout-page
gen-checkout-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/checkout_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-order-page
gen-order-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/order_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-admin-page
gen-admin-page:
	@cd app/frontend && cwgo server --type HTTP --idl ../../idl/frontend/admin_page.proto  --service frontend --module ${ROOT_MOD}/app/frontend -I ../../idl

.PHONY:	gen-rpc
gen-rpc: gen-user gen-product gen-cart gen-payment gen-checkout gen-order


.PHONY:	gen-user
gen-user:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/user.proto --service user -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/user && cwgo server --type RPC --idl ../../idl/user.proto --service user -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"

.PHONY: gen-product
gen-product:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/product.proto --service product -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/product && cwgo server --type RPC --idl ../../idl/product.proto --service product -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"


.PHONY: gen-cart
gen-cart:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/cart.proto --service cart -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/cart && cwgo server --type RPC --idl ../../idl/cart.proto --service cart -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"

.PHONY: gen-payment
gen-payment:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/payment.proto --service payment -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/payment && cwgo server --type RPC --idl ../../idl/payment.proto --service payment -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"

.PHONY: gen-checkout
gen-checkout:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/checkout.proto --service checkout -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/checkout && cwgo server --type RPC --idl ../../idl/checkout.proto --service checkout -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"

.PHONY: gen-order
gen-order:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/order.proto --service order -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/order && cwgo server --type RPC --idl ../../idl/order.proto --service order -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"

.PHONY: gen-email
gen-email:
	@cd rpc_gen && cwgo client --type RPC --idl ../idl/email.proto --service email -module ${ROOT_MOD}/rpc_gen -I ../idl 
	@cd app/email && cwgo server --type RPC --idl ../../idl/email.proto --service email -module ${ROOT_MOD} -I ../../idl --pass "-use ${ROOT_MOD}/rpc_gen/kitex_gen"





