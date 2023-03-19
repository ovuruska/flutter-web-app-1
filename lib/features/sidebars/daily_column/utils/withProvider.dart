import 'package:flutter/material.dart';

import '../../../../common/scheduling/default_context.dart';
import '../../../../common/scheduling/scheduling_context_provider.dart';

withProvider(Widget child) => SchedulingContextProvider(
    child: child, schedulingContext: defaultSchedulingContext);