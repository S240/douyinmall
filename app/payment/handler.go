package main

import (
	"context"

	"github.com/wuyuesong/douyinmall/app/payment/biz/service"
	payment "github.com/wuyuesong/douyinmall/rpc_gen/kitex_gen/payment"
)

// PaymentServiceImpl implements the last service interface defined in the IDL.
type PaymentServiceImpl struct{}

// Charge implements the PaymentServiceImpl interface.
func (s *PaymentServiceImpl) Charge(ctx context.Context, req *payment.ChargeReq) (resp *payment.ChargeResp, err error) {
	resp, err = service.NewChargeService(ctx).Run(req)

	return resp, err
}
