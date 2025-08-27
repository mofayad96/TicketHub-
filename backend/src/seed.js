import mongoose from 'mongoose';
import dotenv from 'dotenv';
import User from './models/User.js';
import Event from './models/Event.js';

dotenv.config();

const MONGO_URI = process.env.MONGO_URI || 'mongodb://127.0.0.1:27017/tickethub';

async function run() {
  await mongoose.connect(MONGO_URI);
  console.log('Connected to MongoDB');

  const adminEmail = process.env.ADMIN_EMAIL || 'admin@tickethub.test';
  let admin = await User.findOne({ email: adminEmail });
  if (!admin) {
    const adminPassword = process.env.ADMIN_PASSWORD || 'Admin123!';
    admin = await User.create({ name: 'Admin', email: adminEmail, password: adminPassword, role: 'admin' });
    console.log('Created admin user:', adminEmail);
  }

  const existing = await Event.countDocuments();
  if (existing === 0) {
    const sample = [
      { title: 'Tech Summit 2025', description: 'Latest in tech', date: new Date(Date.now() + 7*86400000), venue: 'Hall A', price: 49, totalSeats: 50 },
      { title: 'Music Fest', description: 'Live performances', date: new Date(Date.now() + 14*86400000), venue: 'Open Grounds', price: 29, totalSeats: 100 }
    ];
    for (const e of sample) {
      const seats = Array.from({ length: e.totalSeats }).map((_, i) => ({ seatNumber: `S${i + 1}` }));
      await Event.create({ ...e, seats, createdBy: admin._id });
    }
    console.log('Seeded events');
  }

  await mongoose.disconnect();
  console.log('Done');
}

run().catch((e) => {
  console.error(e);
  process.exit(1);
});



