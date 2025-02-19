# 🎡 **carousel_task**

A new Flutter tech task featuring a customizable carousel component.

---

## 🚀 **Getting Started**

This project serves as a starting point for a Flutter application.

---

### ⚡ **How to Run the Project**

1. **Clone the repository:**
   ```sh
   git clone https://github.com/jakublisnik/carousel_task.git
   cd carousel_task
   ```

2. **Install dependencies:**
   ```sh
   flutter pub get
   ```

3. **Run the project:**
   ```sh
   flutter run
   ```

---

### 🧩 **How to Use Individual Components**

#### 📸 **CustomCarouselSlider**  
The `CustomCarouselSlider` component is a customizable carousel slider that can display images in a carousel format.  
It supports both **regular** and **story-style** carousels.

#### ✅ **Usage:**
```dart
CustomCarouselSlider(
  loadedData: ['image_url_1', 'image_url_2', 'image_url_3'],
  controller: CarouselSliderController(),
  isStoryStyle: true, // Set to false for regular carousel
)
```

---

### 📁 **Project Structure**

The project is organized as follows:

```
lib/
├── components/          # 🔄 Reusable UI components (e.g., CustomCarouselSlider)
├── constants/           # 🛠️ Constant values (e.g., API endpoints)
├── models/              # 📝 Data models representing API data structure
├── providers/           # ⚡ State management using the Provider package
├── services/            # 🌐 Service classes for API calls
├── views/               # 🎨 Different views/screens of the application
│   ├── carousels_views/ # 🎞️ Views for carousel variations
│   └── landing_view.dart
└── main.dart            # 🚀 Entry point of the application
```

---

### 📝 **Explanation of the Structure**

- **`components/`**:  
  Contains **reusable UI components** like `CustomCarouselSlider`.  

- **`constants/`**:  
  Holds **constant values** used throughout the project, such as **API endpoints**.  

- **`models/`**:  
  Defines **data models** representing the **structure of data** fetched from APIs.  

- **`providers/`**:  
  Includes **provider classes** for **state management** using the **Provider** package.  

- **`services/`**:  
  Contains **service classes** responsible for **making API calls**.  

- **`views/`**:  
  Consists of **different views/screens** of the application.  

- **`main.dart`**:  
  The **entry point** of the application.  

---

### 🎯 **Why This Structure?**

This structure was chosen to:  
✅ Maintain a **clear separation of concerns**  
✅ Make the codebase more **modular**  
✅ Ensure it is **maintainable** and **scalable**  

---
