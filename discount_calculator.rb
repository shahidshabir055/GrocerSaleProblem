require 'terminal-table'
$all_prices_after_discount = []
$all_prices_before_discount = []
$items_bought = []
$table_data = []
class GroceryItem
    attr_accessor :item_name, :item_quantity, :item_price_after_discount, :item_price_before_discount
    def initialize(item_name, item_quantity)
      @items_details = {
        "milk" => {
          "unit_price" => 3.97,
          "sale_unit_price" => 2.50
        },
        "bread" => {
          "unit_price" => 2.17,
          "sale_unit_price" => 2.0,
        },
        "apple" => {
          "unit_price" => 0.89
        },"banana" =>{
          "unit_price" => 0.99
        }
      }
      @item_name = item_name
      @item_quantity = item_quantity
      @item_price_after_discount = calculate_item_price_after_discount
      @item_price_before_discount = calculate_item_price_before_discount
    end
    def calculate_item_price_after_discount
      case @item_name
      when "milk"
        sale_on_quantity = 2
        final_milk_price = discount_calculator(@items_details[@item_name]["unit_price"], @items_details[@item_name]["sale_unit_price"],sale_on_quantity)
        return final_milk_price
      when "bread"
        sale_on_quantity = 3
        final_bread_price = discount_calculator(@items_details[@item_name]["unit_price"], @items_details[@item_name]["sale_unit_price"],sale_on_quantity)
        return final_bread_price
      when "banana"
        return @items_details[@item_name]["unit_price"] * @item_quantity
      when "apple"
        return @items_details[@item_name]["unit_price"] * @item_quantity
      end
    end
    def calculate_item_price_before_discount
      return @items_details[@item_name]["unit_price"] * @item_quantity
    end
    def discount_calculator(item_unit_price, item_sale_unit_price, sale_on_quantity)
      item_price_after_discount = 0
      if @item_quantity < sale_on_quantity
        item_price_after_discount = item_unit_price * @item_quantity
        return item_price_after_discount
      end
      if @item_quantity >= sale_on_quantity
        item_price_after_discount = ((item_sale_unit_price * sale_on_quantity) * (@item_quantity / sale_on_quantity) ) + (item_unit_price * (@item_quantity % sale_on_quantity))
        return item_price_after_discount
      end
    end
  end
  def accept_user_items
    puts "Please enter all the items purchased separated by a comma"
    $items_bought = gets.chomp.split(',')
    create_item("milk") if $items_bought.include?('milk')
    create_item( "bread") if $items_bought.include?('bread')
    create_item("banana") if $items_bought.include?('banana')
    create_item("apple") if $items_bought.include?('apple')
    display_bill_in_table
  end

  def create_item(item_name)
    quantity = $items_bought.count(item_name)
    single_item = GroceryItem.new(item_name, quantity)
    $table_data << [single_item.item_name.capitalize(), single_item.item_quantity, "$#{single_item.item_price_after_discount}"]
    $all_prices_after_discount.push(single_item.item_price_after_discount)
    $all_prices_before_discount.push(single_item.item_price_before_discount)
  end

  def display_bill_in_table
    table = Terminal::Table.new :headings => ['Item', 'Quantity', 'Price'], :rows => $table_data
    puts table
    generate_receipt
  end
  def generate_receipt
    amount_saved = ($all_prices_before_discount.sum - $all_prices_after_discount.sum).round(2)
    puts"\n Total price: $#{ $all_prices_after_discount.sum.round(2)} \n You saved $#{amount_saved} today."
  end
  accept_user_items
  #milk,milk,bread,banana,bread,bread,bread,milk,apple

