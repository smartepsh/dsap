defmodule DSAP.BinarySearchTree do
  defstruct [:left, :value, :right]

  @moduledoc """
    Binary Search Tree
    It does not have parent. Just have left right and self value.
  """

  alias DSAP.BinarySearchTree, as: BST

  @doc """
  Create a new binary search tree.
  """
  def create(values) when is_list(values) do
    Enum.reduce(values, nil, fn value, tree ->
      insert(tree, value)
    end)
  end

  def create(value) do
    insert(nil, value)
  end

  @doc """
  Insert a node to a tree.
  If the given value equals original value, Ignore it!
  """
  def insert(nil, value) do
    %BST{left: nil, value: value, right: nil}
  end

  def insert(%BST{value: root_value} = tree, value) when value < root_value do
    left = insert(tree.left, value)
    Map.put(tree, :left, left)
  end

  def insert(%BST{value: root_value} = tree, value) when value > root_value do
    right = insert(tree.right, value)
    Map.put(tree, :right, right)
  end

  def insert(%BST{} = tree, _value), do: tree

  @doc """
  Traverse a tree by different orders
  """
  def traverse(tree, order) when order in [:pre_order, :in_order, :post_order] do
    do_traverse(tree, order)
    |> List.flatten()
  end

  def traverse(%BST{}, _), do: raise(ArgumentError, "traverse type is invalid!")

  def traverse(_, _), do: raise(ArgumentError, "Not a tree!")

  defp do_traverse(nil, _), do: []

  defp do_traverse(%BST{} = tree, :pre_order) do
    [tree.value, do_traverse(tree.left, :pre_order), do_traverse(tree.right, :pre_order)]
  end

  defp do_traverse(%BST{} = tree, :in_order) do
    [do_traverse(tree.left, :in_order), tree.value, do_traverse(tree.right, :in_order)]
  end

  defp do_traverse(%BST{} = tree, :post_order) do
    [do_traverse(tree.left, :post_order), do_traverse(tree.right, :post_order), tree.value]
  end
end
