Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:37310 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23993331AbdCNQNgLM22e (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Tue, 14 Mar 2017 17:13:36 +0100
From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH v4] NI 169445 board support
Date: Tue, 14 Mar 2017 11:13:21 -0500
Message-ID: <1489508003-25288-1-git-send-email-nathan.sullivan@ni.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <nathan.sullivan@ni.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linus.walleij@linaro.org, gnurou@gmail.com, mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, ralf@linux-mips.org
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mips@linux-mips.org
Message-ID: <20170314161321.5TjmvaCVKufjZ7cpclkjAo0X0BNfalT4rOCG1Pf-81U@z>

Add support for the National Instruments 169445 board

----
Changes from v3:

- Remove unused ngpios DT property from documentation for the NAND GPIO
bindings and the actual board device tree.
- Add no-output property to the same, for the GPIO controller that is only
used for input signals from NAND.
