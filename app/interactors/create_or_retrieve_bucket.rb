class CreateOrRetrieveBucket
  include Interactor
  include ActionController::Live

  delegate :token, :owner_token, :user_id, to: :context

  def call
    # if the bucket already exists, return it
    if (bucket = Bucket.where(token: token).first)
      return context.bucket = bucket
    end

    # if the user is logged in, and requesting a new bucket, return it
    # # this needs more work, since this also allows for creating custom named buckets by logged in users
    if (user_id)
      context.bucket = Bucket.create(
        owner_token: owner_token,
        user_id: user_id,
        token: token
      )
    end

    # return a 404 page
    # # this needs more work, now it returns a 500 page
    return false

  end
end
