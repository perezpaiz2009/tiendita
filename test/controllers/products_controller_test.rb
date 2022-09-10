    require 'test_helper'

class ProductsControllerTest < ActionDispatch:: IntegrationTest
test 'render a list of products' do
get products_path

assert_response :success
assert_select '.product',2
end

test 'render a detailed product page' do
    get product_path(products(:switch))

    assert_response :success
    assert_select '.title','Nintendo Switch'
    assert_select '.description','Le falla el lector de la tarjeta sd'
    assert_select '.price','$195'
    end

test 'render a new product form' do
    get new_product_path
    assert_response :success
    assert_select 'form'
    end

test 'allow to create a new product' do
    post products_path,params:{
product: {
    title: 'Nintendo 64',
    description:'Le faltan los cables',
    price: 45
    } 
}
    assert_redirected_to products_path
    assert_equal flash[:notice],'Tu producto se creo exitosamente!!!'

    end

    test 'Does not allow to create a new product with empty fields' do
        post products_path,params:{
    product: {
        title: '',
        description:'Le faltan los cables',
        price: 45
        } 
    }
        assert_response :unprocessable_entity
    
        end

        test 'render an edit product form' do
            get edit_product_path(products(:ps4))
            assert_response :success
            assert_select 'form'
            end


            test 'allows to update a product' do
                
                patch product_path(products(:ps4)),params:{
                product: {
                  price: 165
                  } 
                }
                assert_redirected_to products_path
                assert_equal flash[:notice],'Tu producto se ha actualizado correctamente'
            
                end

            
    end 