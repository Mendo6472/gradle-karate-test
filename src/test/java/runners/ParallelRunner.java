import io.karatelabs.core.Runner;
import io.karatelabs.core.SuiteResult;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class ParallelRunner {

    @Test
    void testParallel() {
        SuiteResult result = Runner.path("classpath:features")
                .outputCucumberJson(true)
                .parallel(2);

        assertEquals(0, result.getScenarioFailedCount(), () -> String.join("\n", result.getErrors()));
    }
}
