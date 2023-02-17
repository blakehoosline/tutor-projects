using System;
using System.Collections.Generic;

public class Point2D
{
    public int X { get; set; }
    public int Y { get; set; }

    public Point2D(int x, int y)
    {
        X = x;
        Y = y;
    }
}

public class Shape
{
    public string Color { get; set; }

    public Shape(string color)
    {
        Color = color;
    }

    public virtual void Draw()
    {
        Console.WriteLine($"Drawing a {Color} shape.");
    }
}

public class Line : Shape
{
    public Point2D Start { get; set; }
    public Point2D End { get; set; }

    public Line(Point2D start, Point2D end, string color) : base(color)
    {
        Start = start;
        End = end;
    }

    public override void Draw()
    {
        Console.WriteLine($"Drawing a {Color} line from ({Start.X},{Start.Y}) to ({End.X},{End.Y}).");
    }
}

public class Triangle : Shape
{
    public Point2D P2 { get; set; }
    public Point2D P3 { get; set; }
    private List<Line> _lines;

    public Triangle(Point2D p1, Point2D p2, Point2D p3, string color) : base(color)
    {
        P2 = p2;
        P3 = p3;
        _lines = new List<Line>();

        // Create the three lines and add them to the _lines list
        _lines.Add(new Line(p1, P2, color));
        _lines.Add(new Line(P2, P3, color));
        _lines.Add(new Line(P3, p1, color));
    }

    public override void Draw()
    {
        // Draw each line in the _lines list
        foreach (Line line in _lines)
        {
            line.Draw();
        }
    }
}

class Program
{
    static void Main(string[] args)
    {
        // Create a new Triangle with points (0,0), (0,5), and (5,0) and the color "red"
        Triangle triangle = new Triangle(new Point2D(0, 0), new Point2D(0, 5), new Point2D(5, 0), "red");
        triangle.Draw();
    }
}
