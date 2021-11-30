items =["milk","bread","milk","banana","bread","bread","bread","milk","apple"]
finalMilkPrice =0
finalBreadPrice =0
finalBananaPrice =0
finalApplePrice =0
milkCount=0
bananaCount=0
breadCount=0
appleCount=0
for item in items:
    if(item == "milk"):
        print("milk")
        milkCount += items.count(item)
        items = [value for value in items if value != "milk"]
        if(milkCount>=2):
            qty = milkCount//2
            rem= milkCount%2
            finalMilkPrice=(qty*5+ rem*3.97)
        else:
            finalMilkPrice=milkCount*3.97
    elif(item == "bread"):
        breadCount += items.count(item)
        items = [value for value in items if value != "bread"]
        if(breadCount>=3):
            qty = breadCount//3
            rem= breadCount%3
            finalBreadPrice=(qty*6 + rem*2.17)
        else:
            finalBreadPrice=breadCount*2.17
    elif(item == "banana"):
        bananaCount += items.count(item)
        items = [value for value in items if value != "banana"]
        finalBananaPrice+=bananaCount*0.99
    else:
        appleCount = items.count("apple")
        items = [value for value in items if value != "apple"]
        finalApplePrice+=appleCount*0.89

print("Item"+"   "+"Quantity"+"  "+"Price")
print("___________________________________")
print("Milk"+"       "+str(milkCount)+"        "+str(finalMilkPrice))
print("Bread"+"      "+str(breadCount)+"        "+str(finalBreadPrice))
print("Banana"+"     "+str(bananaCount)+"        "+str(finalBananaPrice))
print("Apple"+"      "+str(appleCount)+"        "+str(finalApplePrice))
print("Total Price  :",finalMilkPrice+finalBreadPrice+finalBananaPrice+finalApplePrice)
ActualPrice = (milkCount*3.97) + (breadCount* 2.17) + (bananaCount*0.99) + (appleCount*0.89)
discountedPrice = finalMilkPrice+finalBreadPrice+finalBananaPrice+finalApplePrice
print("You Saved $",str(round(ActualPrice-discountedPrice,3)), "Today")