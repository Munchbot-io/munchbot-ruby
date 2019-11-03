module Commands
  CUISINE_PREFERENCES = ["Chinese", "Italian", "Thai", "Indian", "Mexican", "Vietnamese"].freeze
  DIETARY_PREFERENCES = ["Vegetarian", "Gluten-Free", "Kosher", "Halal", "Keto", "None"].freeze
  BUDGET_PREFERENCES = ["cheap", "meh", "pricey", "boujie"].freeze

  # You can write all your commands as methods here
  $current_user = { dietary_preference: nil, cuisine: nil}
  # If the command is bound with reply_with specified,
  # you have to deal with user response to the last message and react on it.
  def start_conversation
    # Quick replies are accessible through message object's quick_reply property,
    # by default it's the quick reply text in ALL CAPS
    # you can also react on the text itself
    message.typing_on
    case message.quick_reply
    when 'OK'
      say "Glad you're doing well!"
      stop_thread
    when 'NOT_OK'
      say "Too bad. What happened?"
      next_command :appear_nice
    else
      say "🤖"
      # it's always a good idea to have an else, quick replies don't
      # prevent user from typing any message in the dialogue
      stop_thread
    end
    message.typing_off
  end

  def appear_nice
    message.typing_on
    case message.text
    when /job/i then say "We've all been there"
    when /family/i then say "That's just life"
    else
      say "It shall pass"
    end
    message.typing_off
    stop_thread # future messages from user will be handled from top-level bindings
  end

  def cuisine_preferences
    message.typing_on
    case message.quick_reply
    when 'YES'
      say "Take your pick!", quick_replies: CUISINE_PREFERENCES
      stop_thread
    else
      say "Sorry, we need didn't understand that. Can you type that in?"
    end
    message.typing_off
  end

  def dietary_preferences
    message.typing_on
    text = message.text
    if text == "Thai"
      say "Delish! Can I know what your dietary needs are?", quick_replies: DIETARY_PREFERENCES
      stop_thread
    else
      stop_thread
    end
  end

  def budget_preferences
    message.typing_on
    text = message.text
    if text == "None"
      say "Great what is your budget?", quick_replies: BUDGET_PREFERENCES
      stop_thread
    else
      "Nope"
    end
  end
  
  def show_thai
    message.typing_on
    text = message.text
    if text == "cheap"
      say "Awesome! Since you like Thai I have some options for you."
      show_carousel
      say "Want more options?", quick_replies: CUISINE_PREFERENCES
      stop_thread
    else
      "Nope"
    end
  end

  def mexican_food_flow
    message.typing_on
    say "Sure thing! Here are some more options"
    show_mexican_carousel
    message.typing_on
    say "How far are you willing to go?", quick_replies: ["0.2Miles", "1 - 2 Miles"]
    stop_thread
  end

  def show_mexican_options
    message.typing_on
    say "Here are options where you can find your meal nearby"
    show_options
  end
end


