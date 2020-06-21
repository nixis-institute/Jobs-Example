const getAllJobsQuery ="""
query getJobs{
	jobs{
    id
    company{
      name
    }
    title
    applyUrl
    locationNames
    userEmail
    createdAt
  }
}
""";