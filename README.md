# carousel_task

A new Flutter tech task with carousel.

## Getting Started

This project is a starting point for a Flutter application.

### How to Run the Project

1. **Clone the repository:**
   ```sh
   git clone https://github.com/jakublisnik/carousel_task.git
   cd carousel_task

2. **Install dependencies:**
    flutter pub get

3. **Run the project:**
    flutter run

**How to Use Individual Components**
CustomCarouselSlider
The CustomCarouselSlider component is a customizable carousel slider that can display images in a carousel format. It supports both regular and story-style carousels.

Usage:
```markdown
CustomCarouselSlider(
  loadedData: ['image_url_1', 'image_url_2', 'image_url_3'],
  controller: CarouselSliderController(),
  isStoryStyle: true, // Set to false for regular carousel
)
```

**Project Structure**
The project is organized as follows:
```markdown
lib/
├── components/
│   └── custom_carousel_slider.dart
├── constants/
│   └── environment.dart
├── models/
│   ├── first_collection_model.dart
│   └── second_collection_model.dart
├── providers/
│   └── data_provider.dart
├── services/
│   └── data_services.dart
├── views/
│   ├── carousels_views/
│   │   ├── first_carousel_view.dart
│   │   └── second_carousel_view.dart
│   └── landing_view.dart
└── main.dart
```

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




