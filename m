Message-ID: <000801bf6b14$51b2e620$0ceca8c0@satanas.mips.com>
From: "Kevin D. Kissell" <kevink@mips.com>
Subject: Re: WCHAN on R3000
Date: Sun, 30 Jan 2000 12:22:27 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: owner-linuxmips@oss.sgi.com
Return-Path: <owner-linuxmips@oss.sgi.com>
To: Florian Lohoff <flo@rfc822.org>, Ralf Baechle <ralf@oss.sgi.com>
Cc: linux@cthulhu.engr.sgi.com, linux-mips@fnet.fr, linux-mips@vger.rutgers.edu
Message-ID: <20000130112227.8etCLAMGXL5enBsoX7w6D6zNlykGi48-t_2eGGZjuVE@z>

Note, however, that the incident below happened
on an R4000 platform, not an R3K.   It's probably
more significant that it was on a DECstation, thus
a little-endian platform.  Which set of binaries are
you running?   From your ps output, I don't think
they are the same as I run, and I don't see this
behaviour on my little-endian system.   Most of
the fixes for little-endian kernels that we've made at
MIPS have found their way into the SGI repository,
but one may have been missed, or we may have
an as-yet-undiscovered bug on our hands.

Why on earth would ps be doing a floating point
conversion in the course of displaying wchan,
anyway???

            Kevin K.
__

Kevin D. Kissell
MIPS Technologies European Architecture Lab
kevink@mips.com
Tel. +33.4.78.38.70.67
FAX. +33.4.78.38.70.68

-----Original Message-----
From: Florian Lohoff <flo@rfc822.org>
To: Ralf Baechle <ralf@oss.sgi.com>
Cc: linux@cthulhu.engr.sgi.com <linux@cthulhu.engr.sgi.com>; linux-mips@fnet.fr
<linux-mips@fnet.fr>; linux-mips@vger.rutgers.edu <linux-mips@vger.rutgers.edu>
Date: Sunday, January 30, 2000 12:16 AM
Subject: Re: WCHAN on R3000


>On Fri, Jan 28, 2000 at 09:29:09PM +0100, Ralf Baechle wrote:
>> I've got bugreports which looks like get_wchan() is buggy.  For my machines
>> things look ok, so I assume only R3000 machines might be affected.  Anybody
>> seen the message ``Bug in get_wchan''?  Does the WCHAN column of ``ps axl''
>> look sane?
>
>I think i already reported this ..
>
>------[dmesg output]------------------------------
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Bug in get_wchan
>Setting flush to zero for dpkg-source.
>Unimplemented exception for insn 4620a0a4 at 0x0046f084 in dpkg-source.
>Should send SIGFPE to dpkg-source
>Setting flush to zero for dpkg-source.
>Unimplemented exception for insn 4620a0a4 at 0x0046f084 in dpkg-source.
>Should send SIGFPE to dpkg-source
>Setting flush to zero for dpkg-source.
>Unimplemented exception for insn 4620a0a4 at 0x0046f084 in dpkg-source.
>Should send SIGFPE to dpkg-source
>------------------------------------------
>
>------------------------------------------
>(root@repeat)~# cat /proc/cpuinfo
>cpu                     : MIPS
>cpu model               : R4000SC V3.0
>system type             : Digital DECstation 5000/1xx
>BogoMIPS                : 49.81
>byteorder               : little endian
>unaligned accesses      : 0
>wait instruction        : no
>microsecond timers      : yes
>extra interrupt vector  : no
>hardware watchpoint     : yes
>VCED exceptions         : 750604
>VCEI exceptions         : 4523546
>(root@repeat)~# uname -a
>Linux repeat 2.3.21 #1 Tue Jan 4 18:39:20 GMT 2000 mips unknown
>------------------------------------
>
>I dont know if you call this "sane" ...
>
>-------------------------------
>(root@repeat)~# ps axl
>Unknown HZ value! (0) Assume 100.
>  F   UID   PID  PPID PRI  NI   VSZ  RSS  WCHAN STAT TTY        TIME COMMAND
>  100     0     1     0   0   0  1244  472  5a748 S    ?          0:15 init
>  040     0     2     1   0   0     0    0  5a748 SW   ?          0:01 [kswapd]
>  040     0     3     1   0   0     0    0  5a748 SW   ?          0:01
[kflushd]
>  140     0   105     1   0   0  3772  828  5a6e0 S    ?          0:24
/usr/sbin/s
>  140     0   113     1   0   0  1556  536  5a6e0 S    ?          0:04 syslogd
>  140     0   120     1   0   0  1264  472  5ebb0 S    ?          0:00 klogd
>  140     0   129     1   0   0  1524  468  5a6e0 S    ?          0:00 inetd
>  140     0   142     1   0   0  1192  280  5a748 S    ?          0:12 update
(bdf
>  100     0   300     1   0   0  2612  720  5a748 S    ?          0:07
/usr/lib/po
>  100   502   302   300   0   0  2716  824  5a748 S    ?          0:00
qmgr -l -t
>  100     0 17438     1   0   0  1624  584  5a748 S    ?          0:00
/sbin/mgett
>  100   502 17439   300   0   0  2648  688  5a748 S    ?          0:00
pickup -l -
>  140     0 17442   105   0   0  6080 1452  5a748 S    ?          0:01
/usr/sbin/s
>  100     0 17444 17442   0   0  3232 1324  64a2c S    ttyp0      0:01 -bash
>  100     0 17452 17444   0   0  3028  728      - R    ttyp0      0:00 ps axl
>-------------------------------
>
>Flo
>--
>Florian Lohoff flo@rfc822.org       +49-5241-470566
>"Technology is a constant battle between manufacturers producing bigger and
>more idiot-proof systems and nature producing bigger and better idiots."
>
