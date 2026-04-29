import express, { Request, Response } from 'express';
import cors from 'cors';
import prisma from './lib/prisma.js'; // Note the .js extension for NodeNext

const app = express();
app.use(cors());
app.use(express.json());

// POST: Create a new custom vehicle
app.post('/vehicles', async (req: Request, res: Response) => {
  const { nickname, model, year, paintColor, paintCode } = req.body;

  try {
    const newVehicle = await prisma.vehicle.create({
      data: {
        nickname,
        model,
        year: Number(year),
        paintColor,
        paintCode,
      },
    });
    res.status(201).json(newVehicle);
  } catch (error) {
    res.status(500).json({ error: "Failed to create vehicle" });
  }
});

// GET: Fetch all vehicles with their parts
app.get('/vehicles', async (_req: Request, res: Response) => {
  const vehicles = await prisma.vehicle.findMany({
    include: { parts: true },
  });
  res.json(vehicles);
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});