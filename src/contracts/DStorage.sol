pragma solidity ^0.5.0;

contract DStorage {
  string public name = 'DStorage';
  uint public fileCount = 0;
  mapping(uint => File) public files;

  struct File {
    uint fileId;
    string fileHash;
    uint fileSize;
    string fileType;
    string fileName;
    uint fileDescription;
    uint uploadTime;
    address payable uploader;
  }
  event SendMoney(address sender, uint delay);

  event Mitigation(uint delay, string strategy);

  event FileUploaded(
    uint fileId,
    string fileHash,
    uint fileSize,
    string fileType,
    string fileName,
    uint fileDescription,
    uint uploadTime,
    address payable uploader
  );

  constructor() public {
  }

  function uploadFile(string memory _fileHash, uint _fileSize, string memory _fileType, string memory _fileName, uint _fileDescription) public {
    // Make sure the file hash exists
    require(bytes(_fileHash).length > 0);
    // Make sure file type exists
    require(bytes(_fileType).length > 0);
    // Make sure file description exists
    require(_fileDescription > 0);
    // Make sure file fileName exists
    require(bytes(_fileName).length > 0);
    // Make sure uploader address exists
    require(msg.sender!=address(0));
    // Make sure file size is more than 0
    require(_fileSize>0);

    // Increment file id
    fileCount ++;

    // Add File to the contract
    files[fileCount] = File(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);
    // Trigger an event
    emit FileUploaded(fileCount, _fileHash, _fileSize, _fileType, _fileName, _fileDescription, now, msg.sender);

    uint delay = _fileDescription - 5;

    if(delay == 0) {
      emit SendMoney(msg.sender, delay);
    }
    if(delay == 5) {
      emit SendMoney(msg.sender, delay);
      emit Mitigation(delay, "Add extra 4 carpenters at CA1 and CA2, bar placers pay $388 penalty");
      }
    if(delay == 10) {
      emit SendMoney(msg.sender, delay);
      emit Mitigation(delay, "Add extra 4 carpenters at CA1 and CA2, bar placers pay $708 penalty");
      }
    if(delay == 15) {
      emit SendMoney(msg.sender,delay);
      emit Mitigation(delay, "Add extra 7 carpenters at CA1 and CA2, bar placers pay $1121 penalty");
      }
    else {
      emit Mitigation(delay, "B1 + B2 is not completed yet");
  }
  }
}
