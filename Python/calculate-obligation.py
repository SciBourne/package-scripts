#!/usr/bin/python
#
# Скрипт рассчёта предполагаемой доходности по облигациям.
#


print()
print("", "-" * 30)
print("  Рассчёт доходности облигации ")
print("", "-" * 30)
print()


nominal = (float(input(" Номинал: ")))
price_purchase = nominal * ((float(input(" Цена покупки: "))) * 0.01)
price_selling = None

comission_purchase = price_purchase * ((0.01 + 0.06) * 0.01)
comission_selling = None

coupon = (float(input(" Размер купона: ")))
coupon_numbers_rest = coupon * (float(input(" Остаток купонов: ")))
accumulated_coupon = (float(input(" НКД: ")))


print()
selling = (str(input(" Продажа: ")))
if selling in ["Y", "y", "Yes", "yes", "True", "true", "T", "t", "Да", "да"]:
    price_selling = nominal * ((float(input(" Цена продажи: "))) * 0.01)
    comission_selling = price_selling * ((0.01 + 0.06) * 0.01)
print()


def calculate_income():
    spending = price_purchase + accumulated_coupon + comission_purchase
    income_close = nominal + coupon_numbers_rest

    if price_purchase:
        income_sell = (price_selling + coupon_numbers_rest) - comission_selling

        if price_selling > price_purchase:
            return (income_sell - spending) - ((price_selling - price_purchase) * 0.13)

        elif price_selling <= price_purchase:
            return income_sell - spending

    elif price_purchase < nominal:
        return (income_close - spending) - ((nominal - price_purchase) * 0.13)
    else:
        return income_close - spending


print("", "-" * 30)
print(" Предполагаемая чистая прибыль: %.4f rub"%calculate_income())
print()
