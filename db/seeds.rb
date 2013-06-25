[
  Cause,
  Campaign,
  Need,
  FeaturedCause
].each &:delete_all

5.times.each do
  Factory.create(:cause)
end

Cause.all.each do |cause|
  FeaturedCause.create(cause:cause)
end
