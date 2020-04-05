class Warikan

  attr_accessor :male, :female, :price, :warikan

  def info
    params = {}
    puts "男性は何人？"
    params[:male] = gets.chomp.to_i

    puts "女性は何人？"
    params[:female] = gets.chomp.to_i

    puts "金額は？"
    params[:price] = gets.chomp.to_i

    puts "割り勘の金額は"

    puts params
  end

  def warikan
    # params の情報から割り勘処理
  end

  def round(round: true)
    # 端数切捨て
  end


  private

    def jyosei
      女性1人当たりの金額
    end
end
