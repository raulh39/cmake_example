#include "awesome.h"
#include "gmock/gmock.h"
#include <gmock/gmock.h>

using namespace testing;

TEST(AwesomeLibUnitTest, CanAdd)
{
    auto added = add(40,2);
    ASSERT_THAT(added, Eq(42));
}
