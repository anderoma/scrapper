require_relative '../lib/app'

describe "crypto inventory functions" do

    it "get the names of the crypto" do
        expect(perform('Agrocoin')).to eq('Agrocoin')
    end


   # it "get the value of the crypto" do
    #    expect(get_the_cryptovalue).to eq('$5.93')
   # end
end