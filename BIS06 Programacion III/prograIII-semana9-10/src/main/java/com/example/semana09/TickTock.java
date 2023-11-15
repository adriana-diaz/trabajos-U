package com.example.semana09;

public class TickTock {

    private static final Object lock = new Object(); // Shared lock object

    public static void main(String[] args) {
        Thread tickThread = new Thread(() -> {
            for (int i = 0; i < 500; i++) {
                tick();
            }
        });

        Thread tockThread = new Thread(() -> {
            for (int i = 0; i < 500; i++) {
                tock();
            }
        });

        tickThread.start();
        tockThread.start();
        tickThread.interrupt();
    }

    public static void tick() {
        synchronized (lock) {
            System.out.println("Tick");
            lock.notify(); // Notify waiting thread (tockThread)
            try {
                lock.wait(); // Release the lock and wait for the next notification
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public static void tock() {
        synchronized (lock) {
            System.out.println("Tock");
            lock.notify(); // Notify waiting thread (tickThread)
            try {
                lock.wait(); // Release the lock and wait for the next notification
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
