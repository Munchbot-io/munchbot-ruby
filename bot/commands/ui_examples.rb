module Commands
  # Format of hashes follows JSON format from Messenger Platform documentation:
  # https://developers.facebook.com/docs/messenger-platform/send-messages/templates
  CAROUSEL = [
    {
      title: 'Spicy Thai Curry',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fcdn-image.myrecipes.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2Fmedium_2x%2Fpublic%2F1606p34-spicy-thai-red-curry-beef.jpg%3Fitok%3Dj2Umfvu4&w=450&c=sc&poi=face&q=85',
      subtitle: "That's a first card in a carousel",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    },
    {
      title: 'Pad Thai',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://www.cookingclassy.com/wp-content/uploads/2019/03/pad-thai-1.jpg',
      subtitle: "And here's a second card. You can add up to 10!",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    }
  ].freeze

  MEXICAN_CAROUSEL = [
    {
      title: 'Chili Nachos',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://www.readyseteat.com/sites/g/files/qyyrlu501/files/uploadedImages/img_8981_26134.jpg',
      subtitle: "That's a first card in a carousel",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    },
    {
      title: 'Shrimp Tacos',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://pinchandswirl.com/wp-content/uploads/2018/11/Shrimp-Tacos-served-on-a-platter-with-shrimp-taco-sauce-square.jpg',
      subtitle: "And here's a second card. You can add up to 10!",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    },
    {
      title: 'Mild Ceviche',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://www.spendwithpennies.com/wp-content/uploads/2018/05/Easy-Shrimp-Ceviche-Recipe-3.jpg',
      subtitle: "And here's a second card. You can add up to 10!",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    }
  ].freeze

  MEXICAN_OPTIONS = [
    {
      title: 'Frontera Fresco',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://dailynorthwestern.com/wp-content/uploads/2015/01/DINING_NathanRichards-900x600.jpg',
      subtitle: "That's a first card in a carousel",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    },
    {
      title: 'Taco Burrito King',
      # Horizontal image should have 1.91:1 ratio
      image_url: 'https://media2.trover.com/T/4ea4cc6d7944262f8100011c/fixedw_large_4x.jpg',
      subtitle: "And here's a second card. You can add up to 10!",
      default_action: {
        type: 'web_url',
        url: 'https://unsplash.it'
      },
      buttons: [
        {
          type: :web_url,
          url: 'https://unsplash.it',
          title: 'Website'
        }
      ]
    }
  ].freeze

  BUTTON_TEMPLATE_TEXT = "Look, I'm a message and I have " \
  'some buttons attached!'.freeze
  BUTTON_TEMPLATE_BUTTONS = [
    {
      type: :web_url,
      url: 'https://medium.com/@progapanda',
      title: "Andy's Medium"
    }
  ].freeze

  def show_button_template
    button_template = UI::FBButtonTemplate.new(
      BUTTON_TEMPLATE_TEXT,
      BUTTON_TEMPLATE_BUTTONS
    )
    show(button_template)
  end

  def show_carousel
    show(UI::FBCarousel.new(CAROUSEL))
  end

  def show_mexican_carousel
    show(UI::FBCarousel.new(MEXICAN_CAROUSEL))
  end

  def show_options
    show(UI::FBCarousel.new(MEXICAN_OPTIONS))
  end

  def show_image
    say "Wait a bit while I pick a nice random image for you"
    img_url = 'https://unsplash.it/600/400?random'
    image = UI::ImageAttachment.new(img_url)
    show(image)
  end
end
