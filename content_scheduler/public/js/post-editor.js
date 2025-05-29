document.addEventListener('DOMContentLoaded', function() {
    const platformSelect = document.getElementById('platforms');
    const contentField = document.getElementById('content');
    const charCount = document.getElementById('charCount');
    const imageInput = document.getElementById('image');
    const form = document.getElementById('postForm');

    // 1️⃣ تحميل المنصات من الـ API
    fetch('http://localhost:8000/api/platforms')  // غير الرابط حسب API الخاص بك
        .then(response => response.json())
        .then(data => {
            data.data.forEach(platform => {
                const option = document.createElement('option');
                option.value = platform.id;
                option.textContent = `${platform.name} (${platform.type})`;
                platformSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error fetching platforms:', error));

    // 2️⃣ عداد الحروف مع لون التنبيه
    contentField.addEventListener('input', function() {
        const length = contentField.value.length;
        charCount.textContent = `${length}/1000 characters`;
        if (length > 900) {
            charCount.style.color = 'red';
        } else {
            charCount.style.color = 'black';
        }
    });

    // 3️⃣ معاينة الصورة قبل رفعها
    imageInput.addEventListener('change', function(event) {
        const file = event.target.files[0];
        if (file) {
            const previewContainer = document.getElementById('imagePreview') || document.createElement('div');
            previewContainer.id = 'imagePreview';
            previewContainer.innerHTML = '';  // امسح المعاينة القديمة

            const preview = document.createElement('img');
            preview.src = URL.createObjectURL(file);
            preview.style.maxWidth = '200px';
            preview.style.marginTop = '10px';

            previewContainer.appendChild(preview);
            form.appendChild(previewContainer);
        }
    });

    // 4️⃣ إشعارات عند إرسال الفورم (اختياري)
    form.addEventListener('submit', function(e) {
        // e.preventDefault(); // شيل التعليق لو هتستخدم AJAX بدل الفورم العادي
        alert('📢 Post is being created! Please wait...');
    });
});
