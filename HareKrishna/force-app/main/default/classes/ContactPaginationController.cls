public with sharing class ContactPaginationController {
    @AuraEnabled(cacheable=true)
  public static List<Contact> getPaginatedContacts(Integer pageSize, Integer pageNumber) {
    Integer offset = (pageNumber - 1) * pageSize;
    return [
      SELECT Id, Name, Email, Phone
      FROM Contact
      ORDER BY CreatedDate DESC
      LIMIT :pageSize OFFSET :offset
    ];
  }
}