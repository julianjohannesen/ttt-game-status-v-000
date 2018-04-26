# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left col
  [1,4,7],  # Middle col
  [2,5,8],  # Right col
  [0,4,8],  # Daignol 1
  [2,4,6]  # Diagnol 2
]


def won?(board, marker = "X")
  WIN_COMBINATIONS.find{
    |combo|
    board[combo[0]] == marker && board[combo[1]] == marker && board[combo[2]] == marker
  }
end

def draw?(board)
  return !won?(board) && full?(board)
end

def full?(board)
  return !board.any?{|x| x == "" || x == " "}
end

def over?(board)
  return won?(board) || draw?(board)
end

def winner?(board)
  if won?(board)
    "X"
  elsif won?(board, "O")
    "O"
  else
    nil
  end
end
