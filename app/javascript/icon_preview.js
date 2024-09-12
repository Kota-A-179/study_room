document.addEventListener('DOMContentLoaded', () => {
  const iconDropdown = document.querySelector('.icon-dropdown');
  const iconPreviewImage = document.getElementById('icon-preview-image');

  if (iconDropdown && iconPreviewImage) {
    iconDropdown.addEventListener('change', (event) => {
      const selectedIconId = event.target.value;
      const selectedIcon = Icon.find(icon => icon.attributes.id == selectedIconId);
      if (selectedIcon) {
        iconPreviewImage.src = `/assets/${selectedIcon.attributes.image_path}`;
      }
    });
  }
});