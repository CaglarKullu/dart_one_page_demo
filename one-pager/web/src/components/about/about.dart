import 'package:web/web.dart';

HTMLDivElement createAbout() {
  final about = document.createElement('div') as HTMLDivElement;
  about.className = 'about';

  // Title
  final title = document.createElement('h2') as HTMLHeadingElement;
  title.text = 'Our Story';
  about.appendChild(title);

  // Engaging and Personal Story
  final story = document.createElement('p') as HTMLParagraphElement;
  story.text =
      'Grandma Giovanna was born in Sicily in 1927, amidst the vineyards and rich culinary traditions of her homeland. Following the dramatic events of WWII, she brought her family\'s recipes to America, blending tradition with innovation. Today, at [Restaurant Name], we honor her legacy by bringing you authentic Sicilian cuisine, crafted with love and the finest locally-sourced ingredients. Our executive chef, Marisa, Giovanna\'s granddaughter, invites you to a unique dining experience that tells a story in every bite.';
  about.appendChild(story);

  // Image related to the story
  final storyImage = document.createElement('img') as HTMLImageElement;
  storyImage.src = '../../assets/family.jpg'; // Adjusted relative path
  storyImage.alt = 'A family gathering in Sicily';
  storyImage.style.maxWidth = '100%';
  about.appendChild(storyImage);

  // The Benefit - What Customers Gain
  final benefit = document.createElement('p') as HTMLParagraphElement;
  benefit.text =
      'At [Restaurant Name], you\'re not just our guest, you\'re part of our family. Experience the warmth of Sicilian hospitality, innovative dishes that speak of our heritage, and a dining atmosphere that blends the past with the present. Whether it\'s through our heirloom grain pastas, whole animal butchery, or our commitment to sustainability, we strive to offer you a dining experience that\'s memorable, shareable, and utterly delectable.';
  about.appendChild(benefit);

  // Contact Information and Invitation
  final contactInfo = document.createElement('p') as HTMLParagraphElement;
  contactInfo.text =
      'Join us at 123 Culinary Street, Foodville. For reservations, call us at: 123-456-7890.';
  about.appendChild(contactInfo);

  return about;
}
