class ShoppingListCntroller < ApplicationController
  def create
    @shopping_list = ShoppingList.create(shopping_list_params)
    @shopping_list.items.create(name: 'Pinapple')
    @shopping_list.items.create(name: 'Apple')
    @shopping_list.items.create(name: 'Chicken breasts')
    redirect_to @shopping_list
  end

  private

  def shopping_list_params
    params.require(:shopping_list).permit(:name)
  end
end
