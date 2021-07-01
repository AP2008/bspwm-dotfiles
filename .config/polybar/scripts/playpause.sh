export LD_LIBRARY_PATH=/usr/local/lib/x86_64-linux-gnu;
if ! playerctl status | grep -q "Paused"; then
  echo ""
else
  echo ""
fi
