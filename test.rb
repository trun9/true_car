require_relative "assert"
require 'minitest/autorun'

class BasicTest < Minitest::Test
  include Assert
  def test_sanity
    assert(self.identical?(1,1))
    assert(!self.identical?(2,1))
    assert(self.identical?([],[]))
  end

  def test_simple_object
    my_simple_object = {

        key1: 'value 1',

        key2: 3,

        key3: ['a', 'b', 'c'],

    }



    my_simple_object_2 = {

        key1: 'value 100',

        key2: 30,

        key3: ['c', 'b', 'a'],

    }
    assert(!self.identical?(my_simple_object, my_simple_object_2))
  end

  def test_complex_object
    my_complex_object = [

        {

            key1: 'val1',

            key2: 'val2',

            key3: [

                {

                    subkey_1: ['a', 'b', 'c'],

                    subkey_2: "some value",

                },

                {

                    subkey_1: ['d', 'e', 'f'],

                    subkey_2: "another value",

                }

            ]

        },

        {

            key1: 'val3',

            key2: 'val4',

            key3: [

                {

                    subkey_1: ['g', 'h', 'i'],

                    subkey_2: "a different value",

                },

                {

                    subkey_1: ['j', 'k', 'l'],

                    subkey_2: "value",

                }

            ]

        },

    ]
    assert(self.identical?(my_complex_object, my_complex_object))
  end

  def test_complex_object_with_failure
    my_complex_object = [

        {

            key1: 'val1',

            key2: 'val2',

            key3: [

                {

                    subkey_1: ['a', 'b', 'c'],

                    subkey_2: "some value",

                },

                {

                    subkey_1: ['d', 'e', 'f'],

                    subkey_2: "another value",

                }

            ]

        },

        {

            key1: 'val3',

            key2: 'val4',

            key3: [

                {

                    subkey_1: ['g', 'h', 'i'],

                    subkey_2: "a different value",

                },

                {

                    subkey_1: ['j', 'k', 'l'],

                    subkey_2: "value",

                }

            ]

        },

    ]
    my_complex_object2 = [

        {

            key1: 'val1',

            key2: 'val2',

            key3: [

                {

                    subkey_1: ['a', 'b', 'c'],

                    subkey_2: "some value",

                },

                {

                    subkey_1: ['d', 'e', 'f'],

                    subkey_2: "another value",

                }

            ]

        },

        {

            key1: 'val3',

            key2: 'val4',

            key3: [

                {

                    subkey_1: ['g', 'h', 'i'],

                    subkey_2: "a different value",

                },

                {

                    subkey_1: ['j', 'k', 'l'],

                    subkey_2: "false",

                }

            ]

        },

    ]
    assert(!self.identical?(my_complex_object, my_complex_object2))
  end
end
