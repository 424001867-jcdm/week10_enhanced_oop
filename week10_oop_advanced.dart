// Week 10: Object-Oriented Programming in Dart (Part 2) - Enhanced OOP
// Author: John Carlo Macabangon
// Course: PC16 - Mobile Development with Lab (National Teachers College)

// 4. MIXIN: Reusable capability shared using 'with' outside the main inheritance chain
mixin Discountable {
  double calculateDiscountedPrice(double originalPrice, double discountRate) {
    return originalPrice - (originalPrice * discountRate);
  }
}

// 3. ABSTRACT CLASS / INTERFACE: Defines a contract that derived classes must implement
abstract class Auditable {
  String auditCompliance();
}

// 1. BASE CLASS: General IT Hardware Component (extended from Week 9 concept)
class HardwareComponent {
  String brand;
  String model;
  double _price; // Encapsulation property

  HardwareComponent(this.brand, this.model, this._price);

  double get price => _price;
  set price(double p) {
    if (p > 0) _price = p;
  }

  // Base method to be overridden for Polymorphism
  void displayDetails() {
    print("Base Hardware: $brand $model | Price: PHP ${_price.toStringAsFixed(2)}");
  }
}

// 2. DERIVED CLASS 1: Processor (Inherits HardwareComponent, implements Auditable)
class Processor extends HardwareComponent implements Auditable {
  int coreCount;
  double clockSpeedGhz;

  Processor(String brand, String model, double price, this.coreCount, this.clockSpeedGhz)
      : super(brand, model, price);

  // 2. POLYMORPHISM: Overriding displayDetails() specifically for CPU
  @override
  void displayDetails() {
    print("Processor [CPU]: $brand $model | Cores: $coreCount | Clock: ${clockSpeedGhz}GHz | Price: PHP ${_price.toStringAsFixed(2)}");
  }

  @override
  String auditCompliance() {
    return "Compliance Check [CPU]: Verified secure hardware virtualization & processing standards.";
  }
}

// 2. DERIVED CLASS 2: StorageDrive (Inherits HardwareComponent, implements Auditable)
class StorageDrive extends HardwareComponent implements Auditable {
  String storageType;
  int capacityGb;

  StorageDrive(String brand, String model, double price, this.storageType, this.capacityGb)
      : super(brand, model, price);

  // 2. POLYMORPHISM: Overriding displayDetails() specifically for Storage
  @override
  void displayDetails() {
    print("Storage [${storageType.toUpperCase()}]: $brand $model | Capacity: ${capacityGb}GB | Price: PHP ${_price.toStringAsFixed(2)}");
  }

  @override
  String auditCompliance() {
    return "Compliance Check [Storage]: Verified data encryption & secure media sanitization protocols.";
  }
}

// Separate class utilizing the mixin outside the main inheritance chain
class Accessory with Discountable {
  String itemName;
  double basePrice;

  Accessory(this.itemName, this.basePrice);

  void showAccessoryWithDiscount() {
    double finalCost = calculateDiscountedPrice(basePrice, 0.15); // 15% discount via mixin
    print("Accessory Item: $itemName | Original: PHP ${basePrice.toStringAsFixed(2)} | Discounted (15%): PHP ${finalCost.toStringAsFixed(2)}");
  }
}

void main() {
  print('=============================================');
  print(' PC16 Week 10: Enhanced OOP Hierarchy Test   ');
  print('=============================================\n');

  // Instantiating derived objects
  Processor myCpu = Processor("AMD", "Ryzen 5 5600", 6500.00, 6, 3.7);
  StorageDrive myStorage = StorageDrive("Kingston", "NV2 NVMe SSD", 3200.00, "SSD", 512);

  print('--- Testing Inheritance & Polymorphism ---');
  myCpu.displayDetails();
  print(myCpu.auditCompliance());

  print('');
  myStorage.displayDetails();
  print(myStorage.auditCompliance());

  print('\n--- Testing Mixin Capability (Discountable) ---');
  Accessory peripheral = Accessory("Mechanical Keyboard", 1800.00);
  peripheral.showAccessoryWithDiscount();

  print('\n=============================================');
  print('         Enhanced OOP Execution Complete     ');
  print('=============================================');
}
