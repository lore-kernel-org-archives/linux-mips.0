Received: from mx0a-00010702.pphosted.com ([148.163.156.75]:41665 "EHLO
        mx0b-00010702.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by eddie.linux-mips.org with ESMTP id S23992178AbdCHTgPTUtiF (ORCPT
        <rfc822;linux-mips@linux-mips.org>); Wed, 8 Mar 2017 20:36:15 +0100
From: Nathan Sullivan <nathan.sullivan@ni.com>
Subject: [PATCH v3] NI 169445 board support
Date: Wed, 8 Mar 2017 13:35:42 -0600
Message-ID: <1489001744-26545-1-git-send-email-nathan.sullivan@ni.com>
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
Message-ID: <20170308193542.gG7uAozsiD_Q0QAgBjvFc-dtC6QJSC_IAjrT74ROYd0@z>

Add support for the National Instruments 169445 board

----
Changes from v2:

- Hand write the board config fragment, and make it more minimal.
- Add myself as the maintainer of new dirs and files.
