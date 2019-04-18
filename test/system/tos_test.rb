require "application_system_test_case"

class TosTest < ApplicationSystemTestCase
  test "you have to accept the tos" do
    visit cars_path
  
    # Cannot access that page
    assert_selector ".notification", text: "Sie müssen sich anmelden oder registrieren, bevor Sie fortfahren können."
 
    # Fill in wrong password
    fill_in "E-Mail", with: "futureuser@farsharing.domain"
    fill_in "Passwort", with: "ADMINAdmin"
    find('.actions .button').click #_on "Anmelden"
    assert_selector '.notification', text: "E-Mail oder Passwort ungültig"

    # Here we go, correct password
    fill_in "E-Mail", with: "futureuser@farsharing.domain"
    fill_in "Passwort", with: "futureuseruser"
    find('.actions .button').click
    assert_selector '.notification', text: "Erfolgreich angemeldet."
  end
end
