Received: from mail-by2nam03on0078.outbound.protection.outlook.com ([104.47.42.78]:23616
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S23994624AbdFMW27BnM7u (ORCPT <rfc822;linux-mips@linux-mips.org>);
        Wed, 14 Jun 2017 00:28:59 +0200
From: David Daney <david.daney@cavium.com>
Subject: [PATCH v2 0/5] MIPS: Implement eBPF JIT.
Date: Tue, 13 Jun 2017 15:28:42 -0700
Message-ID: <20170613222847.7122-1-david.daney@cavium.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: <David.Daney@cavium.com>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, ralf@linux-mips.org
Cc: Markos Chandras <markos.chandras@imgtec.com>, Matt Redfearn <matt.redfearn@imgtec.com>, David Daney <david.daney@cavium.com>
Message-ID: <20170613222842.1xG6hpJxkaErzqytssBr02h3nBE-l6uGzYwEXuhrR4o@z>

Changes in v2:

  - Squash a couple of the uasm cleanups.

  - Make insn_table_MM const (suggested by Matt Redfearn)

  - Put the eBPF in its own source file (should fix build
    warnings/errors on 32-bit kernel builds).

  - Use bpf_jit_binary_alloc() (suggested by Daniel Borkmann)

  - Implement tail calls.

  - Fix system call tracing to extract arguments for
    kprobe/__seccomp_filter() tracing (perhaps not really part the the
    JIT, but necessary to have fun with the samples/bpf programs).

Most things in samples/bpf work, still working on the incantations to
build tools/testing/selftests/bpf/ ... 
