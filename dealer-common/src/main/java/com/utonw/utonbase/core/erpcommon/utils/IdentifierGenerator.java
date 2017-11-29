package com.utonw.utonbase.core.erpcommon.utils;

public enum IdentifierGenerator {
    Instance;

    private final static long NANOS_PER_MILLI = 1000;
    private final static long DIVIDOR = 1000000 / NANOS_PER_MILLI;
    private final static long BASELINE = System.currentTimeMillis() * NANOS_PER_MILLI - System
            .nanoTime() / DIVIDOR;

    public long nextId() {
        smallWait(DIVIDOR);
        long aproxSystemNanoTime = BASELINE + System.nanoTime() / DIVIDOR;
        return aproxSystemNanoTime;

    }

    public long safeNextId() {
        synchronized (Instance) {
            pauseOneMilliSecond();
            long aproxSystemNanoTime = BASELINE + System.nanoTime() / DIVIDOR;
            return aproxSystemNanoTime;
        }
    }

    public void smallWait(long delayInNano) {
        long start = System.nanoTime();
        while (start + delayInNano >= System.nanoTime()) ;
    }

    private void pauseOneMilliSecond() {
        try {
            Thread.sleep(1);
        } catch (InterruptedException e) {
            throw new RuntimeException("Should NOT be here.");
        }
    }
}