class UsersController < ApplicationController
   skip_before_action :verify_authenticity_token
  def zip_codes
    zip_code = params[:zipcode]
    age_range = params[:age_range].to_i
    address = "https://api.zip-codes.com/ZipCodesAPI.svc/1.0/FindZipCodesInRadius?zipcode=#{zip_code}&minimumradius=0&maximumradius=50&key=R4HL98UR5HDFPHED0FIQ"
    escaped_address = URI.escape(address)
    uri = URI.parse(escaped_address)
    json = Net::HTTP.get(uri)
    hash = eval(json)
    cities = []
    hash[:DataList].each{|obj| cities << obj[:City]}
    wf = Hash.new(0).tap { |h| cities.each { |word| h[word] += 1 } }.sort_by {|k,v| v}.reverse
    #taking the 50 biggest cities
    biggest_cities = wf[0..50]
    n_zips = 0
    biggest_cities.each{|city|
      n_zips += city[1]
    }
    n_members = 500.0
    proportions = n_members / n_zips
    hash_city = Hash.new
    biggest_cities.each{|city_arr|
      hash_city["#{city_arr[0]}"] = (city_arr[1] * proportions).to_i
    }
    random_user = []
    users_with_photos_prop = n_members * 0.65
    users_without_photos_prop = n_members * 0.35
    users_with_photos_arr = User.where.not(photos: []).order("RANDOM()")[0..users_with_photos_prop]
    # users_with_photos = User.where(id: users_with_photos_arr.map(&:id))
    users_without_photos_arr = User.where(photos: []).order("RANDOM()")[0..users_without_photos_prop]
    # users_without_photos = User.where(id: users_without_photos_arr.map(&:id))
    all_users_arr = users_with_photos_arr + users_without_photos_arr
    all_users = User.where(id: all_users_arr.map(&:id))
    good_age_range_proportion = n_members * 0.65
    bad_age_range_proportion = n_members * 0.35
    if age_range == 18 
      random_users_good_range = all_users.where(age: 18..25).order("RANDOM()")[0..good_age_range_proportion]
      random_users_wrong_range = all_users.where.not(age: 18..25).order("RANDOM()")[0..bad_age_range_proportion]
    elsif age_range == 26 
      random_users_good_range = all_users.where(age: 26..35).order("RANDOM()")[0..good_age_range_proportion]
      random_users_wrong_range = all_users.where.not(age: 26..35).order("RANDOM()")[0..bad_age_range_proportion]
    elsif age_range == 36 
      random_users_good_range = all_users.where(age: 36..55).order("RANDOM()")[0..good_age_range_proportion]
      random_users_wrong_range = all_users.where.not(age: 36..55).order("RANDOM()")[0..bad_age_range_proportion]
    elsif age_range == 56 
      random_users_good_range = all_users.where(age: 56..100).order("RANDOM()")[0..good_age_range_proportion]
      random_users_wrong_range = all_users.where.not(age: 56..100).order("RANDOM()")[0..bad_age_range_proportion]
    end
    random_users = random_users_wrong_range + random_users_good_range
    hash_city.each{|key,value|
      value.times{
        new_user = random_users[0]
        unless new_user == nil 

          user = TemporaryList.create(city: key,
            figure: new_user.figure, ethnicity: new_user.ethnicity, occupation: new_user.occupation,
            description: new_user.description, age: new_user.age,
            marital_status: new_user.marital_status, anything_exciting: new_user.anything_exciting,
            long_term: new_user.long_term, open_anything: new_user.open_anything,
            short_term: new_user.short_term, undecided: new_user.undecided, virtual: new_user.virtual,
            height: new_user.height, hair_color: new_user.hair_color, eye_color: new_user.eye_color,
            smoker: new_user.smoker, anything_goes: new_user.anything_goes,
            dominated: new_user.dominated, dominate: new_user.dominate,
            normal: new_user.normal, threesome: new_user.threesome, secret: new_user.secret,
            active: new_user.active, shy: new_user.shy, sociable: new_user.sociable, fun: new_user.fun, generous: new_user.generous,
            relaxed: new_user.relaxed, moody: new_user.moody, modest: new_user.modest, sensitive: new_user.sensitive, photos: new_user.photos,
            username: new_user.username, independent: new_user.independent,
            mature: new_user.mature, outgoing: new_user.outgoing,
            self_confident: new_user.self_confident, cultivated: new_user.cultivated,
            reliable: new_user.reliable, spiritual: new_user.spiritual,
            imaginative: new_user.imaginative, sophisticated: new_user.sophisticated,
            being_blinded: new_user.being_blinded, willing_experiment: new_user.willing_experiment,
            costume: new_user.costume, role_playing: new_user.role_playing,
            using_sex_toys: new_user.using_sex_toys, unusual_places: new_user.unusual_places,
            being_watched: new_user.being_watched, aerobics: new_user.aerobics, golf: new_user.golf,
            martial_arts: new_user.martial_arts, soccer: new_user.soccer, walking: new_user.walking,
            rugby: new_user.rugby, swimming: new_user.swimming, baseball: new_user.baseball,
            cycling: new_user.cycling, running: new_user.running, tennis: new_user.tennis,
            weight: new_user.weight, basketball: new_user.basketball,
            skiing: new_user.skiing, volleyball: new_user.volleyball, arts: new_user.arts,
            cooking: new_user.cooking, hiking: new_user.hiking, networking: new_user.networking, video_games: new_user.video_games, book: new_user.book,
            dining_out: new_user.dining_out, movies: new_user.movies, nightclubs: new_user.nightclubs,
            religion: new_user.religion, charity: new_user.charity, museum: new_user.museum,
            shopping: new_user.shopping, wine: new_user.wine, coffee: new_user.coffee,
            gardening: new_user.gardening, pets: new_user.pets, gender: new_user.gender, country: "USA"
          )
        end
        random_users.shift
      }
    }
    render json: TemporaryList.all
    TemporaryList.destroy_all
  end
end
